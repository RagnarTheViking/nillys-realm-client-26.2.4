package _L_i
{
   import _1__8._01s;
   import _1__8._1Q_O_;
   import _wi.Injector;
   import _1__8._19A_;
   import flash.display.DisplayObjectContainer;
   import _H_q.ModularContextEvent;
   import _1J_2._01x;
   import _H_q._0ja;
   import _H_q._1aq;
   import _I_w._0S_m;
   
   public class _0cD_ implements _01s
   {
       
      
      private const _0yi:String = _0S_m.create(_0cD_);
      
      private var _0S_Z_:_1Q_O_;
      
      private var _A_A_:Injector;
      
      private var _1aY_:_19A_;
      
      private var _0G_S_:Boolean;
      
      private var _1L_t:Boolean;
      
      public function _0cD_(param1:Boolean = true, param2:Boolean = true)
      {
         super();
         this._0G_S_ = param1;
         this._1L_t = param2;
      }
      
      public function extend(param1:_1Q_O_) : void
      {
         this._0S_Z_ = param1;
         this._A_A_ = param1._T_X_;
         this._1aY_ = param1._A_9(this);
         this._0S_Z_._1za._0H_v(this._0H_v);
      }
      
      public function toString() : String
      {
         return this._0yi;
      }
      
      private function _0H_v() : void
      {
         this._0G_S_ && this._0Z_M_();
         this._1L_t && this._0bk();
      }
      
      private function _0Z_M_() : void
      {
         var _loc1_:DisplayObjectContainer = null;
         if(this._A_A_._T_c(DisplayObjectContainer))
         {
            this._1aY_.debug("Context configured to inherit. Broadcasting existence event...");
            _loc1_ = this._A_A_.getInstance(DisplayObjectContainer);
            _loc1_.dispatchEvent(new ModularContextEvent(ModularContextEvent._si,this._0S_Z_));
         }
         else
         {
            this._1aY_._0G_b("Context has been configured to inherit dependencies but has no way to do so");
         }
      }
      
      private function _0bk() : void
      {
         var _loc1_:_01x = null;
         var _loc2_:DisplayObjectContainer = null;
         if(this._A_A_._T_c(_01x))
         {
            this._1aY_.debug("Context has a ViewManager. Configuring view manager based context existence watcher...");
            _loc1_ = this._A_A_.getInstance(_01x);
            new _0ja(this._0S_Z_,_loc1_);
         }
         else if(this._A_A_._T_c(DisplayObjectContainer))
         {
            this._1aY_.debug("Context has a ContextView. Configuring context view based context existence watcher...");
            _loc2_ = this._A_A_.getInstance(DisplayObjectContainer);
            new _1aq(this._0S_Z_,_loc2_);
         }
         else
         {
            this._1aY_._0G_b("Context has been configured to expose its dependencies but has no way to do so");
         }
      }
   }
}
