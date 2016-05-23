package com.filip.founder.entities;



import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="role")
public class Role {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Long id;
	
    private String role;    
    
    @OneToMany(cascade=CascadeType.ALL)
    @JoinTable(name="uzytkownik_role",
        joinColumns = {@JoinColumn(name="id_role", referencedColumnName="id")},
        inverseJoinColumns = {@JoinColumn(name="id_uzytkownik", referencedColumnName="id")}
    )
    private List<Role> rol;

	public List<Role> getRol() {
		return rol;
	}

	public void setRol(List<Role> rol) {
		this.rol = rol;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}




}
