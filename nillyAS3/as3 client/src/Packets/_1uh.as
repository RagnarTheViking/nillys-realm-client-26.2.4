package Packets
{
   import _1F_z._0P_4;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import com.company.assembleegameclient.objects.Pet;
   import _7m.StatData;
   import _1F_z._gC_;
   import _1F_z._1Z_D_;
   import com.company.assembleegameclient.util.ConditionEffect;
   
   public class _1uh
   {
       
      
      [Inject]
      public var _0xI_:_0P_4;
      
      [Inject]
      public var _14O_:GameSpriteBase;
      
      public function _1uh()
      {
         super();
      }
      
      public function _0t7(param1:Pet, param2:Vector.<StatData>) : void
      {
         var _loc3_:StatData = null;
         var _loc4_:_gC_ = null;
         var _loc5_:* = undefined;
         var _loc6_:_1Z_D_ = param1._W_d || this._H_z(param1,param2);
         if(_loc6_ == null)
         {
            return;
         }
         for each(_loc3_ in param2)
         {
            _loc5_ = _loc3_._16Q_;
            if(_loc3_._M_K_ == StatData.SKIN)
            {
               _loc6_._S_E_(_loc5_);
            }
            switch(_loc3_._M_K_)
            {
               case StatData.PETID:
                  _loc6_.setID(_loc5_);
                  break;
               case StatData.PETSKIN:
                  _loc6_.setName(_loc3_._vP_);
                  break;
               case StatData.PETTYPE:
                  _loc6_.setType(_loc5_);
                  break;
               case StatData.PETRARITY:
                  _loc6_._d(_loc5_);
                  break;
               case StatData.PETMAXLEVEL:
                  _loc6_._r5(_loc5_);
                  break;
               case StatData.PETUNK1:
                  break;
               case StatData.FOODSPENTSKILL1:
                  _loc4_ = _loc6_._0qB_[0];
                  _loc4_.points = _loc5_;
                  break;
               case StatData.FOODSPENTSKILL2:
                  _loc4_ = _loc6_._0qB_[1];
                  _loc4_.points = _loc5_;
                  break;
               case StatData.FOODSPENTSKILL3:
                  _loc4_ = _loc6_._0qB_[2];
                  _loc4_.points = _loc5_;
                  break;
               case StatData.PETSKILL1LEVEL:
                  _loc4_ = _loc6_._0qB_[0];
                  _loc4_.level = _loc5_;
                  break;
               case StatData.PETSKILL2LEVEL:
                  _loc4_ = _loc6_._0qB_[1];
                  _loc4_.level = _loc5_;
                  break;
               case StatData.PETSKILL3LEVEL:
                  _loc4_ = _loc6_._0qB_[2];
                  _loc4_.level = _loc5_;
                  break;
               case StatData.PETSKILL1TYPE:
                  _loc4_ = _loc6_._0qB_[0];
                  _loc4_.type = _loc5_;
                  break;
               case StatData.PETSKILL2TYPE:
                  _loc4_ = _loc6_._0qB_[1];
                  _loc4_.type = _loc5_;
                  break;
               case StatData.PETSKILL3TYPE:
                  _loc4_ = _loc6_._0qB_[2];
                  _loc4_.type = _loc5_;
            }
            if(_loc4_)
            {
               _loc4_._aL_.dispatch(_loc4_);
            }
         }
      }
      
      private function _H_z(param1:Pet, param2:Vector.<StatData>) : _1Z_D_
      {
         var _loc3_:StatData = null;
         var _loc4_:_1Z_D_ = null;
         for each(_loc3_ in param2)
         {
            if(_loc3_._M_K_ == StatData.PETID)
            {
               _loc4_ = this._0xI_._0H_F_(_loc3_._16Q_);
               param1._W_d = !!_loc4_?_loc4_:!!this._14O_.map.isPetYard?this._0xI_.getPetVO(_loc3_._16Q_):new _1Z_D_(_loc3_._16Q_);
               return param1._W_d;
            }
         }
         return null;
      }
      
      public function _1D_V_(param1:Pet, param2:Vector.<StatData>) : void
      {
         var _loc3_:StatData = null;
         var _loc4_:* = undefined;
         for each(_loc3_ in param2)
         {
            _loc4_ = _loc3_._16Q_;
            if(_loc3_._M_K_ == StatData.SKIN)
            {
               param1._S_E_(_loc4_);
            }
            if(_loc3_._M_K_ == StatData.SIZE)
            {
               param1.size_ = _loc4_;
            }
            if(_loc3_._M_K_ == StatData.EFFECTS)
            {
               param1.condition_[ConditionEffect.FirstOrder] = _loc4_;
            }
         }
      }
   }
}
