package _G_Z_
{
   import _v4.Client;
   import _1T_4._0es;
   import flash.display.Sprite;
   import _0pN_._114;
   import _0R_R_._1uC_;
   import _W_Q_._0ag;
   import _0pN_._eg;
   import _0pN_._1my;
   
   public class _1vA_
   {
       
      
      [Inject]
      public var model:Client;
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var view:Sprite;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var _0pM_:_1uC_;
      
      public function _1vA_()
      {
         super();
      }
      
      public function execute() : void
      {
         if(this.model._0hW_)
         {
            this._0Y_Y_();
         }
         else
         {
            this._kU_.dispatch(this.view);
         }
      }
      
      private function _0Y_Y_() : void
      {
         this._kU_.dispatch(new _0ag());
         var _loc1_:_eg = new _eg();
         _loc1_.add(this._0pM_);
         _loc1_.add(new _1my(this._kU_,this.view));
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
   }
}
