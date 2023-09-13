package dev.daniesteb.skeleton.empresarial.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "\"user\"")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Lob
    @Column(name = "name")
    private String name;

    @Lob
    @Column(name = "password")
    private String password;

    @Lob
    @Column(name = "status")
    private String status;

}