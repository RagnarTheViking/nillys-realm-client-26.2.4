package com.company.assembleegameclient.screens.charrects
{
   import ToolTips.MyPlayerToolTip;
   import com.company.assembleegameclient.appengine._0Z_6;
   
   public class MyPlayerToolTipFactory
   {
       
      
      public function MyPlayerToolTipFactory()
      {
         super();
      }
      
      public function create(param1:String, param2:XML, param3:_0Z_6) : MyPlayerToolTip
      {
         return new MyPlayerToolTip(param1,param2,param3);
      }
   }
}
