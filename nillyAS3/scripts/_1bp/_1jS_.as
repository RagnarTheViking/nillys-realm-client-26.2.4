package _1bp
{
   import _1xa.AppendingLineBuilder;
   
   public class _1jS_ extends _7J_
   {
      
      private static const _M_Q_:String = "21";
       
      
      private var _0dO_:XMLList;
      
      private var _1F_3:XMLList;
      
      public function _1jS_()
      {
         super();
         _0N_9 = new AppendingLineBuilder();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         var defense:int = 0;
         var otherDefense:int = 0;
         var itemXML:XML = param1;
         var curItemXML:XML = param2;
         this._0dO_ = itemXML.ActivateOnEquip.(@stat == _M_Q_);
         this._1F_3 = curItemXML.ActivateOnEquip.(@stat == _M_Q_);
         if(this._0dO_.length() == 1 && this._1F_3.length() == 1)
         {
            defense = int(this._0dO_.@amount);
            otherDefense = int(this._1F_3.@amount);
         }
      }
      
      private function _G_f(param1:int, param2:int) : String
      {
         var _loc3_:uint = _0dK_(param1 - param2);
         return _6Z_("+" + param1 + " Defense",_loc3_);
      }
   }
}
