package dev.daniesteb.skeleton.empresarial.util;

import lombok.Getter;
import lombok.Setter;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

import javax.annotation.PostConstruct;
import javax.enterprise.context.Dependent;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

@Dependent
public class ReporteUtil implements Serializable {

    @Inject
    @Getter
    @Setter
    DataManagerSesion dataManagerSesion;

    @Getter
    @Setter
    String numTramite;

    @PostConstruct
    public void init() {

    }

    public void imprimirReporteEnXLS(String nombreArchivoJasper,
                                     String nombreArchivoXLS,
                                     Map<String, Object> parametros)
            throws JRException, IOException, NamingException, SQLException {
        String dataSources = "";
        String jasperPath = "/reportes/" + nombreArchivoJasper + ".jasper";
        InitialContext initialContext = new InitialContext();
        DataSource dataSource = (DataSource)initialContext.lookup(dataSources);
        Connection connection = dataSource.getConnection();
        this.generarReporteEnXLS(parametros, jasperPath, nombreArchivoXLS, connection);
        connection.close();
    }

    public OutputStream generarReporteEnXLS(Map<String, Object> params,
                                            String jasperPath,
                                            String nombreArchivoXLS,
                                            Connection connection)
            throws JRException, IOException, NamingException, SQLException {
        FacesContext fc = FacesContext.getCurrentInstance();
        ExternalContext ec = fc.getCurrentInstance()
                               .getExternalContext();
        String extension = "xls";
        String contentType = "application/vnd.ms-excel";
        String relativeWebPath = ec.getRealPath(jasperPath);
        File file = new File(relativeWebPath);
        JasperPrint print = JasperFillManager.fillReport(file.getPath(), params, connection);
        OutputStream output = ec.getResponseOutputStream();
        ec.responseReset(); // Some JSF component library or some Filter might have set some headers in the buffer beforehand. We want to get rid of them, else it may collide.
        ec.setResponseContentType(contentType); // Check http://www.iana.org/assignments/media-types for all types. Use if necessary ExternalContext#getMimeType() for auto-detection based on filename.
        //        ec.setResponseContentLength(JasperExportManager.exportReportToPdf(print).length); // Set it with the file size. This header is optional. It will work if it's omitted, but the download progress will be unknown.
        ec.setResponseHeader("Content-Disposition",
                             "attachment; filename=\"" + nombreArchivoXLS + "." + extension + "\""); // The Save As popup magic is done here. You can give it any file name you want, this only won't work in MSIE, it will use current request URL as file name instead.
        JRXlsExporter exporterXLS = new JRXlsExporter();

        exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT, print);
        exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, output);
        exporterXLS.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
        exporterXLS.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
        exporterXLS.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
        exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
        exporterXLS.exportReport();

        fc.responseComplete();
        return output;
    }

    public void imprimirReporteEnPDF(String nombreArchivoJasper,
                                     String nombreArchivoPDF,
                                     Map<String, Object> parametros)
            throws JRException, IOException, NamingException, SQLException {
        String dataSources = "";
        String jasperPath = "/reportes/" + nombreArchivoJasper + ".jasper";
        InitialContext initialContext = new InitialContext();
        DataSource dataSource = (DataSource)initialContext.lookup(dataSources);
        Connection connection = dataSource.getConnection();
        this.generarReporteEnPDF(parametros, jasperPath, nombreArchivoPDF, connection);
        connection.close();
    }

    public InputStream imprimirReporteEnPDFConRetorno(String nombreArchivoJasper,
                                                      String nombreArchivoPDF,
                                                      Map<String, Object> parametros)
            throws JRException, IOException, NamingException, SQLException {
        String dataSources = "";
        String jasperPath = "/reportes/" + nombreArchivoJasper + ".jasper";
        InitialContext initialContext = new InitialContext();
        //DataSource dataSource = (DataSource) initialContext.lookup("jdbc/fac-electronica");
        DataSource dataSource = (DataSource)initialContext.lookup(dataSources);
        Connection connection = dataSource.getConnection();
        InputStream is = this.generarReporteEnPDFRetornoInputStream(parametros,
                                                                    jasperPath,
                                                                    nombreArchivoPDF,
                                                                    connection);
        connection.close();
        return is;
    }

    public InputStream imprimirReporteEnPDFConRetornoSinDescarga(String nombreArchivoJasper,
                                                                 String nombreArchivoPDF,
                                                                 Map<String, Object> parametros)
            throws JRException, IOException, NamingException, SQLException {
        String dataSources = "";
        String jasperPath = "/reportes/" + nombreArchivoJasper + ".jasper";
        InitialContext initialContext = new InitialContext();
        //DataSource dataSource = (DataSource) initialContext.lookup("jdbc/fac-electronica");
        DataSource dataSource = (DataSource)initialContext.lookup(dataSources);
        Connection connection = dataSource.getConnection();
        InputStream is = this.generarReporteEnPDFRetornoInputStreamSinDescarga(parametros,
                                                                               jasperPath,
                                                                               nombreArchivoPDF,
                                                                               connection);
        connection.close();
        return is;
    }

    public ByteArrayOutputStream crearReporteEnPDF(String nombreArchivoJasper,
                                                   String nombreArchivoPDF,
                                                   Map<String, Object> parametros)
            throws JRException, IOException, NamingException, SQLException {
        String dataSources = "";
        String jasperPath = "/reportes/" + nombreArchivoJasper + ".jasper";
        InitialContext initialContext = new InitialContext();
        DataSource dataSource = (DataSource)initialContext.lookup(dataSources);
        Connection connection = dataSource.getConnection();
        ByteArrayOutputStream is = generarReportePDFenStream(parametros, jasperPath, nombreArchivoPDF, connection);
        connection.close();
        return is;
    }

    public ByteArrayOutputStream generarReportePDFenStream(Map<String, Object> params,
                                                           String jasperPath,
                                                           String nombreArchivoPDF,
                                                           Connection connection)
            throws JRException, IOException, NamingException, SQLException {
        FacesContext fc = FacesContext.getCurrentInstance();
        ExternalContext ec = fc.getCurrentInstance()
                               .getExternalContext();
        String relativeWebPath = ec.getRealPath(jasperPath);
        File file = new File(relativeWebPath);
        JasperPrint print = JasperFillManager.fillReport(file.getPath(), params, connection);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        JasperExportManager.exportReportToPdfStream(print, baos);
        return baos;
    }

    public OutputStream generarReporteEnPDF(Map<String, Object> params,
                                            String jasperPath,
                                            String nombreArchivoPDF,
                                            Connection connection)
            throws JRException, IOException, NamingException, SQLException {
        FacesContext fc = FacesContext.getCurrentInstance();
        ExternalContext ec = fc.getCurrentInstance()
                               .getExternalContext();
        String extension = "pdf";
        String contentType = "application/pdf";
        String relativeWebPath = ec.getRealPath(jasperPath);
        File file = new File(relativeWebPath);
        JasperPrint print = JasperFillManager.fillReport(file.getPath(), params, connection);
        OutputStream output = ec.getResponseOutputStream();
        ec.responseReset(); // Some JSF component library or some Filter might have set some headers in the buffer beforehand. We want to get rid of them, else it may collide.
        ec.setResponseContentType(contentType); // Check http://www.iana.org/assignments/media-types for all types. Use if necessary ExternalContext#getMimeType() for auto-detection based on filename.
        ec.setResponseContentLength(JasperExportManager.exportReportToPdf(print).length); // Set it with the file size. This header is optional. It will work if it's omitted, but the download progress will be unknown.
        ec.setResponseHeader("Content-Disposition",
                             "attachment; filename=\"" + nombreArchivoPDF + "." + extension + "\""); // The Save As popup magic is done here. You can give it any file name you want, this only won't work in MSIE, it will use current request URL as file name instead.
        JasperExportManager.exportReportToPdfStream(print, output);

        fc.responseComplete();
        return output;
    }

    public void DescargaPDFdePathFisico(String path) {
        //--------------------------------------------------------------
        try {
            File ficheroXLS = new File(path);
            FacesContext ctx = FacesContext.getCurrentInstance();
            FileInputStream fis = new FileInputStream(ficheroXLS);
            byte[] bytes = new byte[1000];
            int read = 0;
            if(!ctx.getResponseComplete()) {
                String fileName = ficheroXLS.getName();
                String contentType = "application/pdf";
                HttpServletResponse response = (HttpServletResponse)ctx.getExternalContext()
                                                                       .getResponse();
                response.setContentType(contentType);
                response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");
                ServletOutputStream out = response.getOutputStream();

                while((read = fis.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }

                out.flush();
                out.close();
                ctx.responseComplete();
            }
        } catch(IOException e) {
        }

        //-------------------------------------------------
    }

    public InputStream getInputStreamReport(String nombreArchivoJasper,
                                            String nombreArchivoPDF,
                                            Map<String, Object> parametros)
            throws NamingException, SQLException, JRException, IOException {
        String dataSources = "";
        String jasperPath = "/reportes/" + nombreArchivoJasper + ".jasper";
        InitialContext initialContext = new InitialContext();
        DataSource dataSource = (DataSource)initialContext.lookup(dataSources);
        Connection connection = dataSource.getConnection();
        FacesContext fc = FacesContext.getCurrentInstance();
        ExternalContext ec = fc.getCurrentInstance()
                               .getExternalContext();
        String relativeWebPath = ec.getRealPath(jasperPath);
        File file = new File(relativeWebPath);

        JasperPrint jp = JasperFillManager.fillReport(file.getPath(), parametros, connection);

        ByteArrayOutputStream os = new ByteArrayOutputStream();
        JasperExportManager.exportReportToPdfStream(jp, os);
        os.flush();
        os.close();

        InputStream is = new ByteArrayInputStream(os.toByteArray());
        connection.close();
        return is;
    }

    public StreamedContent getStreamContentReport(String nombreArchivoJasper,
                                                  String nombreArchivoPDF,
                                                  Map<String, Object> parametros)
            throws NamingException, SQLException, JRException, IOException {
        StreamedContent pdf = null;
        String dataSources = "";
        String jasperPath = "/reportes/" + nombreArchivoJasper + ".jasper";
        InitialContext initialContext = new InitialContext();
        DataSource dataSource = (DataSource)initialContext.lookup(dataSources);
        Connection connection = dataSource.getConnection();
        FacesContext fc = FacesContext.getCurrentInstance();
        ExternalContext ec = fc.getCurrentInstance()
                               .getExternalContext();
        String relativeWebPath = ec.getRealPath(jasperPath);
        File file = new File(relativeWebPath);

        JasperPrint jp = JasperFillManager.fillReport(file.getPath(), parametros, connection);

        ByteArrayOutputStream os = new ByteArrayOutputStream();
        JasperExportManager.exportReportToPdfStream(jp, os);
        os.flush();
        os.close();

        InputStream is = new ByteArrayInputStream(os.toByteArray());
        pdf = new DefaultStreamedContent(is, "application/pdf", nombreArchivoPDF + ".pdf");
        connection.close();
        return pdf;
    }

    public void imprimirReporteEnPDFGuardarPath(String nombreArchivoJasper,
                                                String nombreArchivoPDF,
                                                Map<String, Object> parametros,
                                                String pathDestino)
            throws JRException, IOException, NamingException, SQLException {
        String dataSources = "";
        String jasperPath = "/reportes/" + nombreArchivoJasper + ".jasper";
        InitialContext initialContext = new InitialContext();
        DataSource dataSource = (DataSource)initialContext.lookup(dataSources);
        Connection connection = dataSource.getConnection();
        this.generarReporteEnPDFGuardarPath(parametros, jasperPath, nombreArchivoPDF, connection, pathDestino);
        connection.close();
    }

    public void generarReporteEnPDFGuardarPath(Map<String, Object> params,
                                               String jasperPath,
                                               String nombreArchivoPDF,
                                               Connection connection,
                                               String pathDestino)
            throws JRException, IOException, NamingException, SQLException {
        FacesContext fc = FacesContext.getCurrentInstance();
        ExternalContext ec = fc.getCurrentInstance()
                               .getExternalContext();
        String extension = "pdf";
        String contentType = "application/pdf";
        String relativeWebPath = ec.getRealPath(jasperPath);
        File file = new File(relativeWebPath);
        JasperPrint print = JasperFillManager.fillReport(file.getPath(), params, connection);
        //generar descarga automatica del archivo pdf de  en el navegador (para el correcto funcionamiento revisar que la propiedad ajax = false este en el boton primefeces. NOTA: para este caso se esta quitando la descarga automatica y se ha puesto la propiedad ajax = true del boton)
        //        ec.responseReset(); // Some JSF component library or some Filter might have set some headers in the buffer beforehand. We want to get rid of them, else it may collide.
        //        ec.setResponseContentType(contentType); // Check http://www.iana.org/assignments/media-types for all types. Use if necessary ExternalContext#getMimeType() for auto-detection based on filename.
        //        ec.setResponseContentLength(JasperExportManager.exportReportToPdf(print).length); // Set it with the file size. This header is optional. It will work if it's omitted, but the download progress will be unknown.
        //        ec.setResponseHeader("Content-Disposition", "attachment; filename=\"" + nombreArchivoPDF + "." + extension + "\""); // The Save As popup magic is done here. You can give it any file name you want, this only won't work in MSIE, it will use current request URL as file name instead.
        //        JasperExportManager.exportReportToPdfStream(print, output);
        //guardar en directorio el pdf generado 
        String path = pathDestino + nombreArchivoPDF + "." + extension;
        JasperExportManager.exportReportToPdfFile(print, path);
    }

    public InputStream generarReporteEnPDFRetornoInputStream(Map<String, Object> params,
                                                             String jasperPath,
                                                             String nombreArchivoPDF,
                                                             Connection connection)
            throws JRException, IOException, NamingException, SQLException {
        FacesContext fc = FacesContext.getCurrentInstance();
        ExternalContext ec = fc.getCurrentInstance()
                               .getExternalContext();
        String extension = "pdf";
        String contentType = "application/pdf";
        String relativeWebPath = ec.getRealPath(jasperPath);
        File file = new File(relativeWebPath);
        JasperPrint print = JasperFillManager.fillReport(file.getPath(), params, connection);
        OutputStream output = ec.getResponseOutputStream();
        ec.responseReset(); // Some JSF component library or some Filter might have set some headers in the buffer beforehand. We want to get rid of them, else it may collide.
        ec.setResponseContentType(contentType); // Check http://www.iana.org/assignments/media-types for all types. Use if necessary ExternalContext#getMimeType() for auto-detection based on filename.
        ec.setResponseContentLength(JasperExportManager.exportReportToPdf(print).length); // Set it with the file size. This header is optional. It will work if it's omitted, but the download progress will be unknown.
        ec.setResponseHeader("Content-Disposition",
                             "attachment; filename=\"" + nombreArchivoPDF + "." + extension + "\""); // The Save As popup magic is done here. You can give it any file name you want, this only won't work in MSIE, it will use current request URL as file name instead.
        JasperExportManager.exportReportToPdfStream(print, output);
        //para obtener el InputStream
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        JasperExportManager.exportReportToPdfStream(print, bos);
        bos.flush();
        bos.close();
        InputStream is = new ByteArrayInputStream(bos.toByteArray());
        //
        fc.responseComplete();
        return is;
    }

    public InputStream generarReporteEnPDFRetornoInputStreamSinDescarga(Map<String, Object> params,
                                                                        String jasperPath,
                                                                        String nombreArchivoPDF,
                                                                        Connection connection)
            throws JRException, IOException, NamingException, SQLException {
        FacesContext fc = FacesContext.getCurrentInstance();
        ExternalContext ec = fc.getCurrentInstance()
                               .getExternalContext();
        String relativeWebPath = ec.getRealPath(jasperPath);
        File file = new File(relativeWebPath);
        JasperPrint print = JasperFillManager.fillReport(file.getPath(), params, connection);
        //para obtener el InputStream
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        JasperExportManager.exportReportToPdfStream(print, bos);
        bos.flush();
        bos.close();
        InputStream is = new ByteArrayInputStream(bos.toByteArray());
        return is;
    }
}
