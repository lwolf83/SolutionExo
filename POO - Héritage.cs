using System;

namespace ConsoleApp14
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Homme laurent = new Homme();
            Lezard Denver = new Lezard();



        }
    }

    public abstract class Animal
    {
        protected int _nbpattes;
        protected bool _hasTail;
        protected string _skinType;

        public virtual void Move() { }

    }

    public abstract class Biped : Animal
    {
   
        public Biped()
        {
            _nbpattes = 2;
        }

        public override void Move()
        {
            Console.WriteLine("Pied droit");
            Console.WriteLine("Pied gauche");
        }
    }

    public abstract class Quadriped : Animal
    {
        public Quadriped()
        {
            _nbpattes = 4;
        }

        public override void Move()
        {
            Console.WriteLine("Pied 1 et 3");
            Console.WriteLine("Pied 2 et 4");
        }
    }
        
    public class Homme : Biped
    {
        public Homme()
        {
            _hasTail = false;
            _skinType = "nothing";
        }
    }

    public class Singe : Biped
    {
        public Singe()
        {
            _hasTail = true;
            _skinType = "hair";
        }
    }

    public class Reptile : Quadriped
    {

    }

    public class Tortue : Reptile
    {
        public Tortue()
        {
            _hasTail = false;
            _skinType = "scale";
        }
    }

    public class Lezard : Reptile
    {
        public Lezard()
        {
            _hasTail = true;
            _skinType = "scale";
        }
    }

    public class Elephant : Quadriped
    {
        public Elephant()
        {
            _hasTail = true;
            _skinType = "hair";
        }
    }
}
