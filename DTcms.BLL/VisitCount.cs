using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.BLL
{
    public class VisitCount
    {
        DAL.VisitCount dal = new DAL.VisitCount();

        public void AddVisit(string OID)
        {
            dal.AddVisit(OID);
        }
    }
}
