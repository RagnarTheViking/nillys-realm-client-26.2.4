package _05g
{
   import _P_S_.Mediator;
   import _S_b._O_e;
   import _K_r._yK_;
   import _K_r._1V_v;
   import _K_r._0J_h;
   import _1jl._1fv;
   import com.company.assembleegameclient.objects._1D_v;
   import _05L_._1uF_;
   import com.company.googleanalytics.GA;
   import com.company.assembleegameclient.parameters.Parameters;
   import _td.Options;
   import com.company.assembleegameclient.objects.Player;
   
   public class _1ic extends Mediator
   {
       
      
      [Inject]
      public var view:_05g.CharacterDetailsView;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _006:_yK_;
      
      [Inject]
      public var _E_:_1V_v;
      
      [Inject]
      public var _X_l:_0J_h;
      
      [Inject]
      public var _C_p:_1fv;
      
      [Inject]
      public var _F_C_:_1D_v;
      
      [Inject]
      public var _1rk:_1uF_;
      
      public function _1ic()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._0A_a();
         this.view.init(this._1tf._A_e(),this._1tf._ae());
         this._E_.addOnce(this._E_5);
         this._E_.add(this._1A_h);
         this._X_l.add(this._0tj);
         this.view._0qj.add(this._W_q);
         this.view._0E_D_.add(this._0fr);
      }
      
      private function _0A_a() : void
      {
         this.view._C_p = this._C_p;
         this.view._F_C_ = this._F_C_;
      }
      
      override public function destroy() : void
      {
         this._E_.remove(this._1A_h);
         this._X_l.remove(this._0tj);
         this.view._0qj.remove(this._W_q);
         this.view._0E_D_.remove(this._0fr);
      }
      
      private function _W_q() : void
      {
         this._1rk._1pj();
         this._1tf._14O_.gsc_.escape();
         GA.global().trackEvent("enterPortal","Nexus Button");
         Parameters.data_.needsRandomRealm = false;
         Parameters.save();
      }
      
      private function _0fr() : void
      {
         this._1tf._14O_.mui_.clearInput();
         GA.global().trackEvent("options","Options Button");
         this._1tf._14O_.addChild(new Options(this._1tf._14O_));
      }
      
      private function _E_5(param1:Player) : void
      {
         this.view.update(param1);
      }
      
      private function _1A_h(param1:Player) : void
      {
         this.view.draw(param1);
      }
      
      private function _0tj(param1:String) : void
      {
         this.view.setName(param1);
      }
   }
}
