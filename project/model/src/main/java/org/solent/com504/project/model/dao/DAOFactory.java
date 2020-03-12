package org.solent.com504.project.model.dao;

/**
 *
 * @author Uchitelq
 * used to get the DAOs in the service layer.
 */
public interface DAOFactory {

    /**
     *
     * @return personDao from the EntityManager
     */
    public PersonDAO getPersonDAO();

    /**
     *
     * @return Appointment DAO from the EntityManager
     */
    public AppointmentDAO getAppointmentDAO();

    /**
     *closes the EntityManager
     */
    public void shutDown();
    
}
