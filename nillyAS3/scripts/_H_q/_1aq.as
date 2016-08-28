package _H_q
{
   import _1__8._19A_;
   import _wi.Injector;
   import flash.display.DisplayObjectContainer;
   import _1__8._1Q_O_;
   import _I_w._0S_m;
   
   public class _1aq
   {
       
      
      private const _0yi:String = _0S_m.create(_1aq);
      
      private var _1aY_:_19A_;
      
      private var _A_A_:Injector;
      
      private var _H_J_:DisplayObjectContainer;
      
      private var _0O___:_1Q_O_;
      
      public function _1aq(param1:_1Q_O_, param2:DisplayObjectContainer)
      {
         super();
         this._1aY_ = param1._A_9(this);
         this._A_A_ = param1._T_X_;
         this._H_J_ = param2;
         param1._1za._0O_v(this.destroy);
         this.init();
      }
      
      public function toString() : String
      {
         return this._0yi;
      }
      
      private function init() : void
      {
         this._1aY_.debug("Listening for context existence events on contextView {0}",[this._H_J_]);
         this._H_J_.addEventListener(ModularContextEvent._si,this._0P_e);
      }
      
      private function destroy() : void
      {
         this._1aY_.debug("Removing modular context existence event listener from contextView {0}",[this._H_J_]);
         this._H_J_.removeEventListener(ModularContextEvent._si,this._0P_e);
         if(this._0O___)
         {
            this._1aY_.debug("Unlinking parent injector for child context {0}",[this._0O___]);
            this._0O___._T_X_._19Y_ = null;
         }
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
