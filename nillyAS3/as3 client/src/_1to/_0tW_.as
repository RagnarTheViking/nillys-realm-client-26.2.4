package _1to
{
   import _0E_T_._1zi;
   import _0E_T_._0ih;
   import _0E_T_._Y_F_;
   import _C_._1O_I_;
   import kabam.rotmg.assets.model._0V_v;
   import _0E_T_._1G_k;
   import _0E_T_._1nY_;
   import _0E_T_._0A_e;
   
   public class _0tW_
   {
       
      
      [Inject]
      public var data:XML;
      
      [Inject]
      public var classes:_1zi;
      
      public function _0tW_()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:XML = null;
         var _loc2_:XMLList = this.data.Object;
         for each(_loc1_ in _loc2_)
         {
            this._1sF_(_loc1_);
         }
      }
      
      private function _1sF_(param1:XML) : void
      {
         var _loc2_:int = param1.@type;
         var _loc3_:_0ih = this.classes._0B_M_(_loc2_);
         this._0aE_(_loc3_,param1);
      }
      
      private function _0aE_(param1:_0ih, param2:XML) : void
      {
         var _loc3_:XML = null;
         param1.id = param2.@type;
         param1.name = param2.DisplayId;
         param1.description = param2.Description;
         param1._13U_ = param2.HitSound;
         param1._pb = param2.DeathSound;
         param1._1bj = param2.BloodProb;
         param1._bT_ = this._0jk(param2.SlotTypes);
         param1._0__m = this._0jk(param2.Equipment);
         param1._1gK_ = this._0s8(param2,"MaxHitPoints");
         param1._fF_ = this._0s8(param2,"MaxMagicPoints");
         param1.attack = this._0s8(param2,"Attack");
         param1.defense = this._0s8(param2,"Defense");
         param1.speed = this._0s8(param2,"Speed");
         param1.dexterity = this._0s8(param2,"Dexterity");
         param1._0Y_h = this._0s8(param2,"HpRegen");
         param1._1G_e = this._0s8(param2,"MpRegen");
         param1.unlockCost = param2.UnlockCost;
         for each(_loc3_ in param2.UnlockLevel)
         {
            param1._1H_Z_.push(this._15c(_loc3_));
         }
         param1._E_G_._07z(this._A_q(param2),true);
      }
      
      private function _A_q(param1:XML) : _Y_F_
      {
         var _loc2_:String = param1.AnimatedTexture.File;
         var _loc3_:int = param1.AnimatedTexture.Index;
         var _loc4_:_Y_F_ = new _Y_F_();
         _loc4_.id = 0;
         _loc4_.name = _1O_I_._003;
         _loc4_._0C_3 = new _0V_v(_loc2_,_loc3_);
         _loc4_.setState(_1G_k.OWNED);
         _loc4_._u5(true);
         return _loc4_;
      }
      
      private function _15c(param1:XML) : _1nY_
      {
         var _loc2_:_1nY_ = new _1nY_();
         _loc2_.level = param1.@level;
         _loc2_.character = this.classes._0B_M_(param1.@type);
         return _loc2_;
      }
      
      private function _0s8(param1:XML, param2:String) : _0A_e
      {
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:_0A_e = null;
         var _loc6_:XML = param1[param2][0];
         for each(_loc4_ in param1.LevelIncrease)
         {
            if(_loc4_.text() == param2)
            {
               _loc3_ = _loc4_;
            }
         }
         _loc5_ = new _0A_e();
         _loc5_._E_u = int(_loc6_.toString());
         _loc5_.max = _loc6_.@max;
         _loc5_._8f = !!_loc3_?int(_loc3_.@min):0;
         _loc5_._0on = !!_loc3_?int(_loc3_.@max):0;
         return _loc5_;
      }
      
      private function _0jk(param1:String) : Vector.<int>
      {
         var _loc5_:int = 0;
         var _loc2_:Array = param1.split(",");
         var _loc3_:int = _loc2_.length;
         var _loc4_:Vector.<int> = new Vector.<int>(_loc3_,true);
         while(_loc5_ < _loc3_)
         {
            _loc4_[_loc5_] = int(_loc2_[_loc5_]);
            _loc5_++;
         }
         return _loc4_;
      }
   }
}
