package _1bp
{
   import _1xa.AppendingLineBuilder;
   import _C_._1O_I_;
   import ToolTips._1l1;
   
   public class _1rL_ extends _7J_
   {
       
      
      private var _0Q_C_:XML;
      
      private var _G_g:XML;
      
      private var _sP_:XML;
      
      private var _lq:XML;
      
      public function _1rL_()
      {
         super();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         var tag:XML = null;
         var itemXML:XML = param1;
         var curItemXML:XML = param2;
         _0N_9 = new AppendingLineBuilder();
         this._0Q_C_ = this._tw(itemXML,"Healing");
         this._G_g = this._tw(itemXML,"Damaging");
         this._sP_ = this._tw(curItemXML,"Healing");
         this._lq = this._tw(curItemXML,"Damaging");
         if(this._gG_())
         {
            this._1B_Y_();
            this._mx();
            if(itemXML.@id == "Seal of Blasphemous Prayer")
            {
               tag = itemXML.Activate.(text() == "ConditionEffectSelf")[0];
               _0N_9.pushParams(_1O_I_._1N_G_,{"effect":""});
               _0N_9.pushParams(_1O_I_._13N_,{
                  "effect":_1O_I_._0A_J_(_1O_I_._0U_7),
                  "duration":tag.@duration
               },_1l1._07l(_fO_),_1l1._1S_Z_());
               _1U_C_[tag.toXMLString()] = true;
            }
         }
      }
      
      private function _gG_() : Boolean
      {
         return this._0Q_C_ != null && this._G_g != null && this._sP_ != null && this._lq != null;
      }
      
      private function _tw(param1:XML, param2:String) : XML
      {
         var matches:XMLList = null;
         var tag:XML = null;
         var xml:XML = param1;
         var effectName:String = param2;
         matches = xml.Activate.(text() == "ConditionEffectAura");
         for each(tag in matches)
         {
            if(tag.@effect == effectName)
            {
               return tag;
            }
         }
         return null;
      }
      
      private function _1B_Y_() : void
      {
         var _loc1_:int = int(this._0Q_C_.@duration);
         var _loc2_:int = int(this._sP_.@duration);
         var _loc3_:Number = Number(this._0Q_C_.@range);
         var _loc4_:Number = Number(this._sP_.@range);
         var _loc5_:Number = 0.5 * _loc1_ * 0.5 * _loc3_;
         var _loc6_:Number = 0.5 * _loc2_ * 0.5 * _loc4_;
         var _loc7_:uint = _0dK_(_loc5_ - _loc6_);
         var _loc8_:AppendingLineBuilder = new AppendingLineBuilder();
         _loc8_.pushParams(_1O_I_._1hR_,{"range":this._0Q_C_.@range},_1l1._07l(_loc7_),_1l1._1S_Z_());
         _loc8_.pushParams(_1O_I_._13N_,{
            "effect":_1O_I_._0A_J_(_1O_I_._0jT_),
            "duration":_loc1_.toString()
         },_1l1._07l(_loc7_),_1l1._1S_Z_());
         _0N_9.pushParams(_1O_I_._0A_I_,{"effect":_loc8_});
         _1U_C_[this._0Q_C_.toXMLString()] = true;
      }
      
      private function _mx() : void
      {
         var _loc1_:int = int(this._G_g.@duration);
         var _loc2_:int = int(this._lq.@duration);
         var _loc3_:Number = Number(this._G_g.@range);
         var _loc4_:Number = Number(this._lq.@range);
         var _loc5_:Number = 0.5 * _loc1_ * 0.5 * _loc3_;
         var _loc6_:Number = 0.5 * _loc2_ * 0.5 * _loc4_;
         var _loc7_:uint = _0dK_(_loc5_ - _loc6_);
         var _loc8_:AppendingLineBuilder = new AppendingLineBuilder();
         _loc8_.pushParams(_1O_I_._1hR_,{"range":this._G_g.@range},_1l1._07l(_loc7_),_1l1._1S_Z_());
         _loc8_.pushParams(_1O_I_._13N_,{
            "effect":_1O_I_._0A_J_(_1O_I_._0jL_),
            "duration":_loc1_.toString()
         },_1l1._07l(_loc7_),_1l1._1S_Z_());
         _0N_9.pushParams(_1O_I_._0A_I_,{"effect":_loc8_});
         _1U_C_[this._G_g.toXMLString()] = true;
      }
   }
}
