package org.solent.com504.project.model.service;
import org.solent.com504.project.model.dao.DAOFactory;
/**
 *
 * @author Uchitelq
 * Calls the corresponding DAOFactory methods
 * @see DAOFactory
 */
public interface ServiceObjectFactory {

    public void shutDown();

    public ServiceFacade getServiceFacade();
}
