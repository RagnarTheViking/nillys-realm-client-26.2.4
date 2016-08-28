package _15G_
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0wP_._ou;
   import _gs._123;
   import _0f.IMediatorMap;
   import _05L_._05T_;
   import _Y_8._0B_R_;
   import _05L_._1uF_;
   import _1I_S_._1vz;
   import _1I_S_._1d5;
   import _1I_S_._0J_a;
   import _0jo._0oc;
   import _1I_S_._1J_W_;
   import _0jo._1E_1;
   import _1I_S_._0b__;
   import _0jo._1Y_r;
   import Packets.PacketManagerBase;
   import Packets.Server.Text;
   import _1I_S_._vM_;
   import _1I_S_._0I_V_;
   import _1I_S_._0O_J_;
   import _Y_8._vv;
   import _Y_8._0tG_;
   import _Y_8._0Y_d;
   import _Y_8._0nB_;
   import _Y_8.Chat;
   import _Y_8._1R_W_;
   import _Y_8._bV_;
   import _Y_8._0N_l;
   
   public class _1ty implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _0d3:_ou;
      
      [Inject]
      public var _1S_M_:_123;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      public function _1ty()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_05T_).asSingleton();
         this._T_X_.map(_1ty).asSingleton();
         this._T_X_.map(_0B_R_).asSingleton();
         this._T_X_.map(_1uF_).asSingleton();
         this._T_X_.map(_1vz).asSingleton();
         this._T_X_.map(_1d5).asSingleton();
         this._T_X_.map(_0J_a).asSingleton();
         this._1S_M_.map(_0oc).toCommand(_1J_W_);
         this._1S_M_.map(_1E_1).toCommand(_0b__);
         this._1S_M_.map(_1Y_r).toCommand(_0b__);
         this._0d3.map(PacketManagerBase.TEXT)._is(Text)._W___(_vM_);
         this._1S_M_.map(_0I_V_).toCommand(_0O_J_);
         this.mediatorMap.map(_vv).toMediator(_0tG_);
         this.mediatorMap.map(_0Y_d).toMediator(_0nB_);
         this.mediatorMap.map(Chat).toMediator(_1R_W_);
         this.mediatorMap.map(_bV_).toMediator(_0N_l);
      }
   }
}
