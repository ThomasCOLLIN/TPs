using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace lemett_aBugTrack
{
    // REMARQUE : vous pouvez utiliser la commande Renommer du menu Refactoriser pour changer le nom d'interface "IServiceClientBugTrack" à la fois dans le code et le fichier de configuration.
    [ServiceContract]
    public interface IServiceClientBugTrack
    {
        [OperationContract]
        List<DataAccess.T_Bug> GetListBugWithEF(int max);
    }
}
