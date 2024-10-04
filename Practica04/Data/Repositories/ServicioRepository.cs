using Practica04.Data.Models;

namespace Practica04.Data.Repositories
{
    public class ServicioRepository : IServicioRepository
    {
        private readonly ServicioDbContext _context;

        public ServicioRepository(ServicioDbContext context)
        {
            _context = context;
        }

        public bool Create(TServicio oServicio)
        {
            _context.TServicios.Add(oServicio);
            return _context.SaveChanges() > 0;
        }

        public bool Delete(int id)
        {
            var serDel = _context.TServicios.Find(id);
            if(serDel != null)
            {
                serDel.EnPromocion = "N";
                _context.TServicios.Update(serDel);
                return _context.SaveChanges() > 0;
            }
            return false;
        }

        public List<TServicio> GetAll()
        {
            return _context.TServicios
                .Where(x => x.EnPromocion == "S")
                .ToList();
        }

        public TServicio? GetById(int id)
        {
            return _context.TServicios.Find(id);
        }

        public bool Update(TServicio oServicio, int id)
        {
            var serUpd = _context.TServicios.Find(id);
            if(serUpd != null)
            {
                serUpd.Nombre = oServicio.Nombre;
                serUpd.Costo = oServicio.Costo;

                _context.TServicios.Update(serUpd);
                return _context.SaveChanges() > 0;
            }
            return false;
        }
    }
}
