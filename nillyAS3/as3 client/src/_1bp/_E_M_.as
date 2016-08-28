package _1bp
{
   import _1xa.AppendingLineBuilder;
   import _C_._1O_I_;
   import ToolTips._1l1;
   
   public class _E_M_ extends _7J_
   {
       
      
      public function _E_M_()
      {
         super();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         _loc3_ = this._mS_(param1);
         _loc4_ = this._mS_(param2);
         _0N_9 = new AppendingLineBuilder();
         if(_loc3_ != null && _loc4_ != null)
         {
            _loc5_ = Number(_loc3_.@duration);
            _loc6_ = Number(_loc4_.@duration);
            this._1mM_(_loc5_,_loc6_);
            _1U_C_[_loc3_.toXMLString()] = true;
         }
         this._0A_c(param1);
      }
      
      private function _0A_c(param1:XML) : void
      {
         var teleportTag:XML = null;
         var itemXML:XML = param1;
         if(itemXML.@id == "Cloak of the Planewalker")
         {
            _0N_9.pushParams(_1O_I_._0vd,{},_1l1._07l(_fO_),_1l1._1S_Z_());
            teleportTag = XML(itemXML.Activate.(text() == ActivateEffect.TELEPORT))[0];
            _1U_C_[teleportTag.toXMLString()] = true;
         }
      }
      
      private function _mS_(param1:XML) : XML
      {
         var matches:XMLList = null;
         var conditionTag:XML = null;
         var xml:XML = param1;
         matches = xml.Activate.(text() == ActivateEffect.CONDITIONEFFECTSELF);
         for each(conditionTag in matches)
         {
            if(conditionTag.(@effect == "Invisible"))
            {
               return conditionTag;
            }
         }
         return null;
      }
      
      private function _1mM_(param1:Number, param2:Number) : void
      {
         var _loc3_:uint = _0dK_(param1 - param2);
         _0N_9.pushParams(_1O_I_._1N_G_,{"effect":""});
         _0N_9.pushParams(_1O_I_._13N_,{
            "effect":_1O_I_._0A_J_(_1O_I_._1cS_),
            "duration":param1.toString()
         },_1l1._07l(_loc3_),_1l1._1S_Z_());
      }
   }
}
