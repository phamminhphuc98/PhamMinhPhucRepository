//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShopCaPhe.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class MENU
    {
        public int ID { get; set; }
        public string MenuName { get; set; }
        public Nullable<int> ParentID { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public string Link { get; set; }
    }
}
