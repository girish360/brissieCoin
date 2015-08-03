

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/**
 * The CartItem Class
 * 
 * Basically a structure for holding item data
 */
public class CartItem : IEquatable<CartItem>
{
    public int CoinId { get; set; }
    public string Name { get; set; }
    public double Price { get; set; }
    public string Picture { get; set; }
    public int Quantity { get; set; }
    public double Total { get; set; }

    public CartItem(int CoinId, string Name, double Price, string Picture, int Quantity)
    {
        this.CoinId = CoinId;
        this.Name = Name;
        this.Price = Price;
        this.Picture = Picture;
        this.Quantity = Quantity;
        this.Total = Price * Quantity;
    }


    public void add()
    {
        List<CartItem> ItemList = new List<CartItem>();

        if (HttpContext.Current.Session["CartItem"] != null)
        {
            ItemList = (List<CartItem>)HttpContext.Current.Session["CartItem"];
        }

        var item = ItemList.Where(d => d.CoinId == this.CoinId).FirstOrDefault();
        if (item != null)
        {
            item.Quantity = item.Quantity + 1;
            item.Total = item.Quantity * item.Price;
        }
        else
        {
            ItemList.Add(this);
        }


        HttpContext.Current.Session["CartItem"] = ItemList;
    }

    public static List<CartItem> getItems()
    {
        List<CartItem> ItemList = new List<CartItem>();


        if (HttpContext.Current.Session["CartItem"] != null)
        {
            ItemList = (List<CartItem>)HttpContext.Current.Session["CartItem"];
        }

        return ItemList;
    }

    public static void remove(int CoinId)
    {
        List<CartItem> ItemList = new List<CartItem>();

        if (HttpContext.Current.Session["CartItem"] != null)
        {
            ItemList = (List<CartItem>)HttpContext.Current.Session["CartItem"];
        }

        var itemToRemove = ItemList.SingleOrDefault(r => r.CoinId == CoinId);

        if (itemToRemove != null)
            ItemList.Remove(itemToRemove);

        HttpContext.Current.Session["CartItem"] = ItemList;
    }

    public static void update(int CoinId, int Quantity)
    {
        List<CartItem> ItemList = new List<CartItem>();

        if (HttpContext.Current.Session["CartItem"] != null)
        {
            ItemList = (List<CartItem>)HttpContext.Current.Session["CartItem"];
        }

        var item = ItemList.SingleOrDefault(r => r.CoinId == CoinId);


        if (item != null)
        {
            item.Quantity = item.Quantity + Quantity;
            item.Total = item.Quantity * item.Price;
            HttpContext.Current.Session["CartItem"] = ItemList;
        }
    }

    public static void updateItem(int CoinId, string Name, double Price, string Picture, int Quantity, double Total)
    {
        List<CartItem> ItemList = new List<CartItem>();

        if (HttpContext.Current.Session["CartItem"] != null)
        {
            ItemList = (List<CartItem>)HttpContext.Current.Session["CartItem"];
        }

        var item = ItemList.SingleOrDefault(r => r.CoinId == CoinId);


        if (item != null)
        {
            item.Quantity = Quantity;
            item.Total = item.Quantity * item.Price;
            HttpContext.Current.Session["CartItem"] = ItemList;
        }
    }

    public static void clearItems()
    {
        List<CartItem> ItemList = new List<CartItem>();
        HttpContext.Current.Session["CartItem"] = ItemList;
    }

    public static double grandTotal()
    {
        List<CartItem> ItemList = new List<CartItem>();

        if (HttpContext.Current.Session["CartItem"] != null)
        {
            ItemList = (List<CartItem>)HttpContext.Current.Session["CartItem"];
        }

        double grandTotal = 0;

        foreach (var item in ItemList)
        {
            grandTotal += item.Total;
        }

        return grandTotal;
    }

    public bool Equals(CartItem item)
    {
        return item.CoinId == this.CoinId;
    }
}
