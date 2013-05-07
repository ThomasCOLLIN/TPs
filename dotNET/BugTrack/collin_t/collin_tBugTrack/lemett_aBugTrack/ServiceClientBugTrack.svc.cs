using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace lemett_aBugTrack
{
    // REMARQUE : vous pouvez utiliser la commande Renommer du menu Refactoriser pour changer le nom de classe "ServiceClientBugTrack" à la fois dans le code, le fichier svc et le fichier de configuration.
    // REMARQUE : pour lancer le client test WCF afin de tester ce service, sélectionnez ServiceClientBugTrack.svc ou ServiceClientBugTrack.svc.cs dans l'Explorateur de solutions et démarrez le débogage.
    public class ServiceClientBugTrack : IServiceClientBugTrack
    {
        public List<DataAccess.T_Bug> GetListBugWithEF(int max)
        {
            return DataAccess.Bug.GetLastBugs(max);
        }
    }
}
