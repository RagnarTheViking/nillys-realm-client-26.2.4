package _04h
{
   import _f7.Signal;
   import _ge._v1;
   import _1F_z._0P_4;
   import _0E_T_._1zi;
   import kabam.rotmg.assets.services._0pW_;
   import _0E_T_._Y_F_;
   
   public class _1Q_v
   {
       
      
      public const _165:Signal = new Signal();
      
      [Inject]
      public var _R_U_:_v1;
      
      [Inject]
      public var _06I_:_0P_4;
      
      [Inject]
      public var _0ta:_1zi;
      
      [Inject]
      public var factory:_0pW_;
      
      public var _14g:Boolean = false;
      
      public var _0P_9:_04h._083;
      
      public var _O_h:int = 0;
      
      public function _1Q_v()
      {
         this._0P_9 = new _04h._083();
         super();
         this.clear();
      }
      
      public function clear() : void
      {
         this._14g = false;
         this._0P_9.arenaWave = 0;
         this._0P_9.arenaTime = -1;
      }
      
      public function _1H_W_() : void
      {
         if(this._14g)
         {
            this._14g = false;
         }
         else
         {
            this._0P_9.arenaWave++;
            this._165.dispatch();
         }
      }
      
      public function _0S_y() : Boolean
      {
         return this._0P_9.arenaTime != -1;
      }
      
      public function _0e2() : void
      {
         this.clear();
         this._0P_9.name = this._R_U_.player.name_;
         var _loc1_:_Y_F_ = this._0ta._0B_M_(this._R_U_.player.objectType_)._E_G_._nV_(this._R_U_.player.skin_);
         this._0P_9._each = this.factory.makeIcon(_loc1_._0C_3,100,this._R_U_.player.getTex1(),this._R_U_.player.getTex2());
         this._0P_9.pet = this._06I_._0T_T_();
         this._0P_9.guildName = this._R_U_.player.guildName_;
         this._0P_9._17I_ = this._R_U_.player.guildRank_;
         this._0P_9._bT_ = this._R_U_.player._01e.concat();
         this._0P_9._W_V_ = this._R_U_.player.inventory_.concat();
         this._0P_9._0I_p = true;
      }
   }
}
