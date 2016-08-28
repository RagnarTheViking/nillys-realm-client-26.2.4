package _H_q
{
   import _1__8._19A_;
   import _wi.Injector;
   import _1J_2._01x;
   import _1__8._1Q_O_;
   import flash.display.DisplayObjectContainer;
   import _1I_2._I_7;
   import _I_w._0S_m;
   
   public class _0ja
   {
       
      
      private const _0yi:String = _0S_m.create(_0ja);
      
      private var _1aY_:_19A_;
      
      private var _A_A_:Injector;
      
      private var _X_f:_01x;
      
      private var _0O___:_1Q_O_;
      
      public function _0ja(param1:_1Q_O_, param2:_01x)
      {
         super();
         this._1aY_ = param1._A_9(this);
         this._A_A_ = param1._T_X_;
         this._X_f = param2;
         param1._1za._0O_v(this.destroy);
         this.init();
      }
      
      public function toString() : String
      {
         return this._0yi;
      }
      
      private function init() : void
      {
         var _loc1_:DisplayObjectContainer = null;
         for each(_loc1_ in this._X_f._8e)
         {
            this._1aY_.debug("Adding context existence event listener to container {0}",[_loc1_]);
            _loc1_.addEventListener(ModularContextEvent._si,this._0P_e);
         }
         this._X_f.addEventListener(_I_7._0S_k,this._12e);
         this._X_f.addEventListener(_I_7._1G_X_,this._0K_q);
      }
      
      private function destroy() : void
      {
         var _loc1_:DisplayObjectContainer = null;
         for each(_loc1_ in this._X_f._8e)
         {
            this._1aY_.debug("Removing context existence event listener from container {0}",[_loc1_]);
            _loc1_.removeEventListener(ModularContextEvent._si,this._0P_e);
         }
         this._X_f.removeEventListener(_I_7._0S_k,this._12e);
         this._X_f.removeEventListener(_I_7._1G_X_,this._0K_q);
         if(this._0O___)
         {
            this._1aY_.debug("Unlinking parent injector for child context {0}",[this._0O___]);
            this._0O___._T_X_._19Y_ = null;
         }
      }
      
      private function _12e(param1:_I_7) : void
      {
         this._1aY_.debug("Adding context existence event listener to container {0}",[param1.container]);
         param1.container.addEventListener(ModularContextEvent._si,this._0P_e);
      }
      
      private function _0K_q(param1:_I_7) : void
      {
         this._1aY_.debug("Removing context existence event listener from container {0}",[param1.container]);
         param1.container.removeEventListener(ModularContextEvent._si,this._0P_e);
      }
      
      private function _0P_e(param1:ModularContextEvent) : void
      {
         param1.stopImmediatePropagation();
         this._0O___ = param1.context;
         this._1aY_.debug("Context existence event caught. Configuring child context {0}",[this._0O___]);
         this._0O___._T_X_._19Y_ = this._A_A_;
      }
   }
}
