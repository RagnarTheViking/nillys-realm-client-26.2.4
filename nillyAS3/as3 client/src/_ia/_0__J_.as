package _ia
{
   import _P_S_.Mediator;
   import _0Q_Q_._v__;
   import _04e._05X_;
   import _1T_4._0es;
   import _1T_4._1S_b;
   import _1T_4._0V_s;
   import _6w._0x0;
   import kabam.rotmg.assets.services._0pW_;
   import Packets.Server.Death;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.assembleegameclient.objects._sV_;
   import com.company.assembleegameclient.util._Z_4;
   import com.company.assembleegameclient.util._18Q_;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import _0hx._Q_p;
   
   public class _0__J_ extends Mediator
   {
       
      
      [Inject]
      public var view:_ia.FameView;
      
      [Inject]
      public var _R_e:_v__;
      
      [Inject]
      public var _0pS_:_05X_;
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var _mR_:_1S_b;
      
      [Inject]
      public var _S_s:_0V_s;
      
      [Inject]
      public var _0pM_:_0x0;
      
      [Inject]
      public var factory:_0pW_;
      
      private var _0X_Q_:Boolean;
      
      private var death:Death;
      
      public function _0__J_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.closed.add(this._qN_);
         this._S_s.dispatch("/fame");
         this._g7();
         this._C_w();
      }
      
      override public function destroy() : void
      {
         this.view.closed.remove(this._qN_);
         this.view._0Q_P_();
         this.death && this.death._16a();
         this._0pM_._0P_3.removeAll();
      }
      
      private function _g7() : void
      {
         this._0X_Q_ = this._0pS_._0z__();
         this.view._1U_0(this._0X_Q_);
         this.death = this._0pS_._1sw();
         if(this.death && this.death.background)
         {
            this.view._04o(this.death.background);
         }
      }
      
      private function _C_w() : void
      {
         this._0pM_.accountId = this._R_e.accountId;
         this._0pM_.charId = this._R_e._1lf;
         this._0pM_._0P_3.addOnce(this._0T_z);
         this._0pM_.start();
      }
      
      private function _0T_z(param1:_0x0, param2:Boolean, param3:String = "") : void
      {
         var _loc4_:BitmapData = this.makeIcon();
         this.view._1Q_s(param1.name,param1.level,param1.type);
         this.view._0S_b(param1._1Z_E_,param1.killer);
         this.view.setIcon(_loc4_);
         this.view._0Y_A_(param1._1__h,param1.xml);
      }
      
      private function makeIcon() : BitmapData
      {
         if(this._0X_Q_ && this.death._0W_1)
         {
            return this._0I_A_();
         }
         return this._1yf();
      }
      
      private function _1yf() : BitmapData
      {
         return this.factory.makeIcon(this._0pM_._0C_3,250,this._0pM_.texture1,this._0pM_.texture2);
      }
      
      private function _0I_A_() : BitmapData
      {
         var _loc1_:_sV_ = ObjectLibrary._1eh[this.death._09L_];
         var _loc2_:_Z_4 = _loc1_._1vr;
         var _loc3_:_18Q_ = _loc2_.imageFromDir(_Z_4.RIGHT,_Z_4._M_J_,0);
         return TextureRedrawer.resize(_loc3_.image_,_loc3_.mask_,250,true,this._0pM_.texture1,this._0pM_.texture2);
      }
      
      private function _qN_() : void
      {
         if(this._0X_Q_)
         {
            this._kU_.dispatch(new _Q_p());
         }
         else
         {
            this._mR_.dispatch();
         }
      }
   }
}
