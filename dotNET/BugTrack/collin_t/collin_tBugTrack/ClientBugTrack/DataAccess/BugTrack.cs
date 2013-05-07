using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientBugTrack.DataAccess
{
    class BugTrack
    {
        private static ServiceReferenceBugTrack.ServiceClientBugTrackClient _client =
            new ServiceReferenceBugTrack.ServiceClientBugTrackClient();

        public static ServiceReferenceBugTrack.ServiceClientBugTrackClient Client
        {
            get { return _client; }
            set { _client = value; }
        }

        public static List<ServiceReferenceBugTrack.T_Bug> GetListBugWithEF(int max)
        {
            return new List<ServiceReferenceBugTrack.T_Bug> (_client.GetListBugWithEF(max));
        }
    }
}
