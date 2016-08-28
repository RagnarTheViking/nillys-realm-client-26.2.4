package _1O_R_
{
   import _P_S_.Mediator;
   import _3b.CloseDialogsSignal;
   import _f7.Signal;
   
   public class _0e8 extends Mediator
   {
       
      
      [Inject]
      public var _3B_:_1O_R_._1uu;
      
      [Inject]
      public var _1n0:CloseDialogsSignal;
      
      private var _10S_:Signal;
      
      public function _0e8()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._10S_ = this._3B_._1tG_();
         this._10S_.add(this._fH_);
      }
      
      private function _fH_() : void
      {
         this._1n0.dispatch();
      }
      
      override public function destroy() : void
      {
         this._10S_.remove(this._fH_);
      }
   }
}
