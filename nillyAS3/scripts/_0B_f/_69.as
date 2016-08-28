package _0B_f
{
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _0wP_._ou;
   import _1k1.ReskinCharacterView;
   import _1k1._0G_g;
   import _1k1.ReskinPanel;
   import _1k1._0mq;
   import _lE_._K_i;
   import _lE_._10W_;
   import _lE_._0X_y;
   import _lE_._1nk;
   import _lE_._0cw;
   import _lE_._1m7;
   import Packets.PacketManagerBase;
   import Packets.Client.Reskin;
   import _lE_._1B_b;
   
   public class _69 implements IConfig
   {
       
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var _0d3:_ou;
      
      public function _69()
      {
         super();
      }
      
      public function configure() : void
      {
         this.mediatorMap.map(ReskinCharacterView).toMediator(_0G_g);
         this.mediatorMap.map(ReskinPanel).toMediator(_0mq);
         this._1S_M_.map(_K_i).toCommand(_10W_);
         this._1S_M_.map(_0X_y).toCommand(_1nk);
         this._1S_M_.map(_0cw).toCommand(_1m7);
         this._0d3.map(PacketManagerBase.RESKIN)._is(Reskin)._W___(_1B_b);
         this.context._1za._1dl(this._09i);
      }
      
      private function _09i() : void
      {
         this._T_X_.getInstance(_K_i).dispatch();
      }
   }
}
