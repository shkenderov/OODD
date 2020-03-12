package org.solent.com504.project.model.web;

import org.solent.com504.project.model.service.ServiceFacade;
import org.solent.com504.project.model.service.ServiceObjectFactory;
import org.solent.com504.project.model.service.ServiceFacade;
/**
 *
 * @author Uchitelq
 * Used by the Web applications. uses the ServiceFactory methods 
 * @see ServiceObjectFactory
 * @see ServoceFacade
 */
public interface WebObjectFactory {

    public ServiceFacade getServiceFacade();
    
    public void shutDown();
}
