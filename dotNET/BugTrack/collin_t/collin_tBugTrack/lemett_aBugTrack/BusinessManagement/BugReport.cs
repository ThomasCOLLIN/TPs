using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Diagnostics;

namespace lemett_aBugTrack.BusinessManagement
{
    public class BugReport
    {

        public static bool GenerateReportBug(long idBug)
        {
            DBO.BugReport report = DataAccess.Bug.GetBugAsBugReport(idBug);
            if (report == null)
                return false;
            string reportFileName = DataAccess.BugReport.GenerateReportBug(report);

            Debug.WriteLine(reportFileName);
            return reportFileName != "";
        }
    }
}