package _P_v
{
   import _0pN_._049;
   import flash.display.LoaderInfo;
   import _1R_9._J_m;
   import _0E_n._jE_;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _1__8._19A_;
   import _1dw._0yI_;
   import flash.display.DisplayObject;
   
   public class _0ex extends _049
   {
       
      
      [Inject]
      public var info:LoaderInfo;
      
      [Inject]
      public var _1iN_:_J_m;
      
      [Inject]
      public var _H_u:_jE_;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _0G_2:_19A_;
      
      private var _3B_:_0yI_;
      
      public function _0ex()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this._0G_2.debug("startTask");
         this._H_u._1iN_.addChild(this._1iN_ as DisplayObject);
         this._1iN_._1K_O_.addOnce(this.requestSessionTicket);
         this._1iN_.load(this.info.parameters.steam_api_path);
      }
      
      private function requestSessionTicket() : void
      {
         this._0G_2.debug("requestSessionTicket");
         this._1iN_._0W_R_.addOnce(this._B_q);
         this._1iN_.requestSessionTicket();
      }
      
      private function _B_q(param1:Boolean) : void
      {
         this._0G_2.debug("session received - isValid? {0}",[param1]);
         if(param1)
         {
            _0et(true);
         }
         else
         {
            this._zA_();
         }
      }
      
      private function _zA_() : void
      {
         this._3B_ = this._3B_ || new _0yI_();
         this._3B_.ok.addOnce(this._1nQ_);
         this._06Z_.dispatch(this._3B_);
      }
      
      private function _1nQ_() : void
      {
         this._0dR_.dispatch();
         this.requestSessionTicket();
      }
   }
}
