package _1bp
{
   import _1xa.AppendingLineBuilder;
   import ToolTips._1l1;
   import _C_._1O_I_;
   
   public class GeneralProjectileComparison extends _7J_
   {
       
      
      private var itemXML:XML;
      
      private var curItemXML:XML;
      
      private var _zw:XML;
      
      private var _1M_e:XML;
      
      public function GeneralProjectileComparison()
      {
         super();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         this.itemXML = param1;
         this.curItemXML = param2;
         _0N_9 = new AppendingLineBuilder();
         if(param1.hasOwnProperty("NumProjectiles"))
         {
            this._1G_T_();
            _1U_C_[param1.NumProjectiles.toXMLString()] = true;
         }
         if(param1.hasOwnProperty("Projectile"))
         {
            this._C_f();
            _1U_C_[param1.Projectile.toXMLString()] = true;
         }
         this._8S_();
      }
      
      private function _C_f() : void
      {
         this._0gm();
         var _loc1_:Number = Number(this._zw.Speed) * Number(this._zw.LifetimeMS) / 10000;
         var _loc2_:Number = Number(this._1M_e.Speed) * Number(this._1M_e.LifetimeMS) / 10000;
         var _loc3_:String = _1l1._0me(_loc1_);
         _0N_9.pushParams(_1O_I_._04y,{"range":_6Z_(_loc3_,_0dK_(_loc1_ - _loc2_))});
         if(this._zw.hasOwnProperty("MultiHit"))
         {
            _0N_9.pushParams(_1O_I_._1l2,{},_1l1._07l(_Q_q),_1l1._1S_Z_());
         }
         if(this._zw.hasOwnProperty("PassesCover"))
         {
            _0N_9.pushParams(_1O_I_._1O_e,{},_1l1._07l(_Q_q),_1l1._1S_Z_());
         }
         if(this._zw.hasOwnProperty("ArmorPiercing"))
         {
            _0N_9.pushParams(_1O_I_._1O_d,{},_1l1._07l(_fO_),_1l1._1S_Z_());
         }
      }
      
      private function _1G_T_() : void
      {
         var _loc1_:int = int(this.itemXML.NumProjectiles);
         var _loc2_:int = int(this.curItemXML.NumProjectiles);
         var _loc3_:uint = _0dK_(_loc1_ - _loc2_);
         _0N_9.pushParams(_1O_I_._1z9,{"numShots":_6Z_(_loc1_.toString(),_loc3_)});
      }
      
      private function _0gm() : void
      {
         this._zw = XML(this.itemXML.Projectile);
         var _loc1_:int = int(this._zw.MinDamage);
         var _loc2_:int = int(this._zw.MaxDamage);
         var _loc3_:Number = (_loc2_ + _loc1_) / 2;
         this._1M_e = XML(this.curItemXML.Projectile);
         var _loc4_:int = int(this._1M_e.MinDamage);
         var _loc5_:int = int(this._1M_e.MaxDamage);
         var _loc6_:Number = (_loc5_ + _loc4_) / 2;
         var _loc7_:String = (_loc1_ == _loc2_?_loc1_:_loc1_ + " - " + _loc2_).toString();
         _0N_9.pushParams(_1O_I_.DAMAGE,{"damage":_6Z_(_loc7_,_0dK_(_loc3_ - _loc6_))});
      }
      
      private function _8S_() : void
      {
         if(this.itemXML.RateOfFire.length() == 0 || this.curItemXML.RateOfFire.length() == 0)
         {
            return;
         }
         var _loc1_:Number = Number(this.curItemXML.RateOfFire[0]);
         var _loc2_:Number = Number(this.itemXML.RateOfFire[0]);
         var _loc3_:int = int(_loc2_ / _loc1_ * 100);
         var _loc4_:int = _loc3_ - 100;
         if(_loc4_ == 0)
         {
            return;
         }
         var _loc5_:uint = _0dK_(_loc4_);
         var _loc6_:String = _loc4_.toString();
         if(_loc4_ > 0)
         {
            _loc6_ = "+" + _loc6_;
         }
         _loc6_ = _6Z_(_loc6_ + "%",_loc5_);
         _0N_9.pushParams(_1O_I_._dt,{"data":_loc6_});
         _1U_C_[this.itemXML.RateOfFire[0].toXMLString()];
      }
   }
}
