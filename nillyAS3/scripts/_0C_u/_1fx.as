package _0C_u
{
   import _07i._1B_j;
   import _1T_4._34;
   import _0pN_._114;
   import _v4.Client;
   import _04e._05X_;
   import _0Q_Q_._v__;
   import _0pN_._M_Y_;
   import _0pN_._1nd;
   import _0pN_._1my;
   
   public class _1fx
   {
       
      
      [Inject]
      public var _0pM_:_1B_j;
      
      [Inject]
      public var update:_0C_u._tx;
      
      [Inject]
      public var error:_34;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var player:Client;
      
      [Inject]
      public var death:_05X_;
      
      [Inject]
      public var model:_v__;
      
      public function _1fx()
      {
         super();
      }
      
      public function execute() : void
      {
         this._0pM_.charId = this._0uQ_();
         var _loc1_:_M_Y_ = new _M_Y_(this._0pM_,this._1V_M_(),this._1j1());
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
      
      private function _0uQ_() : int
      {
         if(this.player.isRegistered() && this.death._0z__())
         {
            return this.death._1sw().charId_;
         }
         return -1;
      }
      
      private function _1V_M_() : _1nd
      {
         return new _1my(this.update);
      }
      
      private function _1j1() : _1nd
      {
         return new _1my(this.error,this._0pM_);
      }
   }
}
