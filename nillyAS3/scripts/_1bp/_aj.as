package _1bp
{
   import _1xa.AppendingLineBuilder;
   import _C_._1O_I_;
   import ToolTips._1l1;
   
   public class _aj extends _7J_
   {
       
      
      private var _0lI_:XML;
      
      private var speedy:XML;
      
      private var _pv:XML;
      
      private var _mH_:XML;
      
      private var _0G_j:XML;
      
      private var _1P_f:XML;
      
      public function _aj()
      {
         super();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         this._1ki(param1,param2);
         _0N_9 = new AppendingLineBuilder();
         this._9e();
         this._T_I_();
         this._u();
      }
      
      private function _1ki(param1:XML, param2:XML) : void
      {
         this._0lI_ = this._0P_g(param1,"Berserk");
         this.speedy = this._1W_V_(param1,"Speedy");
         this._0G_j = this._1W_V_(param1,"Armored");
         this._pv = this._0P_g(param2,"Berserk");
         this._mH_ = this._1W_V_(param2,"Speedy");
         this._1P_f = this._1W_V_(param2,"Armored");
      }
      
      private function _0P_g(param1:XML, param2:String) : XML
      {
         var matches:XMLList = null;
         var tag:XML = null;
         var xml:XML = param1;
         var typeName:String = param2;
         matches = xml.Activate.(text() == ActivateEffect.CONDITIONEFFECTAURA);
         for each(tag in matches)
         {
            if(tag.@effect == typeName)
            {
               return tag;
            }
         }
         return null;
      }
      
      private function _1W_V_(param1:XML, param2:String) : XML
      {
         var matches:XMLList = null;
         var tag:XML = null;
         var xml:XML = param1;
         var typeName:String = param2;
         matches = xml.Activate.(text() == ActivateEffect.CONDITIONEFFECTSELF);
         for each(tag in matches)
         {
            if(tag.@effect == typeName)
            {
               return tag;
            }
         }
         return null;
      }
      
      private function _9e() : void
      {
         if(this._0lI_ == null || this._pv == null)
         {
            return;
         }
         var _loc1_:Number = Number(this._0lI_.@range);
         var _loc2_:Number = Number(this._pv.@range);
         var _loc3_:Number = Number(this._0lI_.@duration);
         var _loc4_:Number = Number(this._pv.@duration);
         var _loc5_:Number = 0.5 * _loc1_ + 0.5 * _loc3_;
         var _loc6_:Number = 0.5 * _loc2_ + 0.5 * _loc4_;
         var _loc7_:uint = _0dK_(_loc5_ - _loc6_);
         var _loc8_:AppendingLineBuilder = new AppendingLineBuilder();
         _loc8_.pushParams(_1O_I_._1hR_,{"range":_loc1_.toString()},_1l1._07l(_loc7_),_1l1._1S_Z_());
         _loc8_.pushParams(_1O_I_._13N_,{
            "effect":_1O_I_._0A_J_(_1O_I_._1O_o),
            "duration":_loc3_.toString()
         },_1l1._07l(_loc7_),_1l1._1S_Z_());
         _0N_9.pushParams(_1O_I_._0A_I_,{"effect":_loc8_});
         _1U_C_[this._0lI_.toXMLString()] = true;
      }
      
      private function _T_I_() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this.speedy != null && this._mH_ != null)
         {
            _loc1_ = Number(this.speedy.@duration);
            _loc2_ = Number(this._mH_.@duration);
            _0N_9.pushParams(_1O_I_._1N_G_,{"effect":""});
            _0N_9.pushParams(_1O_I_._13N_,{
               "effect":_1O_I_._0A_J_(_1O_I_._S_M_),
               "duration":_loc1_.toString()
            },_1l1._07l(_0dK_(_loc1_ - _loc2_)),_1l1._1S_Z_());
            _1U_C_[this.speedy.toXMLString()] = true;
         }
         else if(this.speedy != null && this._mH_ == null)
         {
            _0N_9.pushParams(_1O_I_._1N_G_,{"effect":""});
            _0N_9.pushParams(_1O_I_._13N_,{
               "effect":_1O_I_._0A_J_(_1O_I_._S_M_),
               "duration":this.speedy.@duration
            },_1l1._07l(_0pA_),_1l1._1S_Z_());
            _1U_C_[this.speedy.toXMLString()] = true;
         }
      }
      
      private function _u() : void
      {
         if(this._0G_j != null)
         {
            _0N_9.pushParams(_1O_I_._1N_G_,{"effect":""});
            _0N_9.pushParams(_1O_I_._13N_,{
               "effect":_1O_I_._0A_J_(_1O_I_._2J_),
               "duration":this._0G_j.@duration
            },_1l1._07l(_fO_),_1l1._1S_Z_());
            _1U_C_[this._0G_j.toXMLString()] = true;
         }
      }
   }
}
