using System;

namespace BeerEncapsulator
{
    public class BeerEncapsulator
    {

        private double _avalaibleBeerVolume;
        private double _volumeBootle = 0.33;
        private int _avalaibleBottles;
        private int _avalaibleCapsules;
        

        public void SetAvalaibleBeerVolume(double beerVolume)
        {
            _avalaibleBeerVolume = beerVolume;
        }

        public void SetAvalaibleBottles(int bootles)
        {
            if (bootles > 0)
            {
                _avalaibleBottles = bootles;
            }
            else
            {
                _avalaibleBottles = 0;
            }
        }

        public void SetAvalaibleCapsules(int Capsules)
        {
            if(Capsules > 0)
            {
                _avalaibleCapsules = Capsules;
            }
            else
            {
                _avalaibleCapsules = 0;
            }
           
        }

        public void AddBeer(double beerVolume)
        {
            if(beerVolume > 0)
            {
                _avalaibleBeerVolume = _avalaibleBeerVolume + beerVolume;
            }
        }

        public int ProduceEncapsulatedBeerBottles(int nbBootles)
        {
            int produceBootles = nbBootles;
            while (_avalaibleBottles > 0 && _avalaibleCapsules > 0 && _avalaibleBeerVolume > 0.33 && nbBootles > 0)
            {
                _avalaibleBottles--;
                _avalaibleCapsules--;
                produceBootles--;
                _avalaibleBeerVolume = _avalaibleBeerVolume - 0.33;
            }
            if(nbBootles == 0)
            {
                return 0;
            }
            else
            {
                return nbBootles - produceBootles;
            }
            

        }

        public void displayMissingObjects(int bottlesToProduce)
        {
            if(_volumeBootle * bottlesToProduce > _avalaibleBeerVolume)
            {
                Console.WriteLine("Beer missing : " + (_avalaibleBeerVolume - _volumeBootle * bottlesToProduce));
            }
            else
            {
                Console.WriteLine("Beer Volume : OK");
            }

            if(_avalaibleBottles < bottlesToProduce)
            {
                Console.WriteLine("Bootles missing : " + (bottlesToProduce - _avalaibleBottles));
            }
            else
            {
                Console.WriteLine("Bootles number : OK");
            }

            if (_avalaibleCapsules < bottlesToProduce)
            {
                Console.WriteLine("Capsules missing : " + (bottlesToProduce - _avalaibleCapsules));
            }
            else
            {
                Console.WriteLine("Capsules number : OK");
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {

            int nbBootles, nbCaps, nbBootlesToProduce;
            int nbBootlesProduced;
            double volumeBeer;

            BeerEncapsulator beerFactory = new BeerEncapsulator();

            Console.WriteLine("Enter the volume of beer :");
            volumeBeer = Convert.ToDouble(Console.ReadLine());
            beerFactory.AddBeer(volumeBeer);

            Console.WriteLine("Enter the number of bootle :");
            nbBootles = Convert.ToInt32(Console.ReadLine());
            beerFactory.SetAvalaibleBottles(nbBootles);

            Console.WriteLine("Enter the number of caps :");
            nbCaps = Convert.ToInt32(Console.ReadLine());
            beerFactory.SetAvalaibleCapsules(nbCaps);

            Console.WriteLine("Enter the number of bootles to produce :");
            nbBootlesToProduce = Convert.ToInt32(Console.ReadLine());


            nbBootlesProduced = beerFactory.ProduceEncapsulatedBeerBottles(nbBootlesToProduce);

            Console.WriteLine("Number of bootles produced : " + nbBootlesProduced);

            if(nbBootlesToProduce > nbBootlesProduced)
            {
                beerFactory.displayMissingObjects(nbBootlesToProduce - nbBootlesProduced);
            }

        }
    }
}
