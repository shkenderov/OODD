package org.solent.com504.project.model.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
/**
 *
 * @author Uchitelq
 * Class containing the attributes of the Person in the system.
 * The methods are only getters and setters, other methods handled by DAO
 * The role is dentist or patient (enum)
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)

@Entity
public class Person {
/**
 * @param id is set upon entering an appointment in the database. This is done by the DAO.
 */
    private Long id;

    private String firstName;

    private String secondName;

    private Role role;

    private String address;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSecondName() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Person{" + "id=" + id + ", firstName=" + firstName + ", secondName=" + secondName + ", role=" + role + ", address=" + address + '}';
    }

    public Person save() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
    
}
