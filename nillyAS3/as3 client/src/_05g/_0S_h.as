package _05g
{
   import _P_S_.Mediator;
   import _W_Q_._oG_;
   import _06s._F_d;
   import _0Q_Q_._42;
   
   public class _0S_h extends Mediator
   {
       
      
      [Inject]
      public var view:_oG_;
      
      [Inject]
      public var _13A_:_F_d;
      
      public function _0S_h()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._1A_4.add(this._08I_);
      }
      
      override public function destroy() : void
      {
         this.view._1A_4.remove(this._08I_);
      }
      
      private function _08I_(param1:int) : void
      {
         this._13A_.dispatch(new _42(this.view.accountId,param1));
      }
   }
}
