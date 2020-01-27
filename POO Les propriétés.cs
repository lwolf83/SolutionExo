using System;
using System.Collections.Generic;
using System.Linq;

namespace Encapsulation
{
    public class Program
    {
        public static void Main(string[] args)
        {
            House house = new House();
            Room room = new Room();
            Door houseDoor = new Door();
            Door roomDoor = new Door();
            house.AddDoor(houseDoor);
            room.AddDoor(roomDoor);
            house.AddRoom(room);

        }
    }

    public class House
    {
        private List<Room> _rooms;
        private List<Door> _doors;

        public List<Room> Rooms
        {
            get { return _rooms; }
        }

        public List<Door> Doors
        {
            get { return _doors; }
        }

        public House()
        {
            _rooms = new List<Room>();
            _doors = new List<Door>();
        }

        public void AddDoor(Door door)
        {
            _doors.Add(door);
        }

        public void AddRoom(Room room)
        {
            _rooms.Add(room);
        }
    }

    public class Room
    {
        private List<Door> _doors;

        public List<Door> Doors
        {
            get { return _doors; }
        }

        public Room()
        {
            _doors = new List<Door>();
        }

        public void AddDoor(Door door)
        {
            _doors.Add(door);
        }
    }

    public class Door
    {
        private bool _isOpen;

        public bool IsOpen
        {
            get { return _isOpen; }
        }


        public Door()
        {
            _isOpen = false;
        }

        public void Open()
        {
            if (_isOpen)
            {
                Console.WriteLine("Door already opened. Ain't done anything.");
            }
            else
            {
                _isOpen = true;
            }
        }

        public void Close()
        {
            if (!_isOpen)
            {
                Console.WriteLine("Door already closed. Ain't done anything.");
            }
            else
            {
                _isOpen = false;
            }
        }
    }
}
