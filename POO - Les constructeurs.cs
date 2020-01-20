using System;
using System.Collections.Generic;

namespace ConsoleApp13
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Entrer the number of floor :");
            int floorCount = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Entrer the size of the building :");
            int buildingSize = Convert.ToInt32(Console.ReadLine());
            Building WildCodeSchool = new Building(floorCount, buildingSize);

            Console.WriteLine("Floor max size : " + WildCodeSchool.GetFloorMaxSize());
            Console.WriteLine("Floor count : " + WildCodeSchool.GetFloorCount());
            Console.WriteLine("Building size : " + WildCodeSchool.GetSize());

            Console.WriteLine("Entrer the number of floor (height default = 3m) :");
            floorCount = Convert.ToInt32(Console.ReadLine());

            Building WildCodePasSchool = new Building(floorCount, buildingSize);

            Console.WriteLine("Floor max size : " + WildCodePasSchool.GetFloorMaxSize());
            Console.WriteLine("Floor count : " + WildCodePasSchool.GetFloorCount());
            Console.WriteLine("Building size : " + WildCodePasSchool.GetSize());
        
    }
    }

    class Building
    {
        private int _floorCount;
        private int _sizeBuilding;



        public Building(int nbEtage, int buildingSize)
        {
            _floorCount = nbEtage;
            _sizeBuilding = buildingSize;
        }

        public Building(int i)
        {
            _floorCount = i;
            _sizeBuilding = _floorCount * 300;
        }

        public int GetFloorMaxSize()
        {
            return _sizeBuilding / _floorCount;
        }

        public int GetFloorCount()
        {
            return _floorCount;
        }

        public int GetSize()
        {
            return _sizeBuilding;
        }
    }
}
