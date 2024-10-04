using Practica04.Data.Models;

namespace Practica04.Data.Repositories
{
    public interface IServicioRepository
    {
        List<TServicio> GetAll();
        TServicio? GetById(int id);
        bool Create(TServicio oServicio);
        bool Update(TServicio oServicio, int id);
        bool Delete(int id);
    }
}
