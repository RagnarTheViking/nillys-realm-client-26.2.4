package _0E_T_
{
   import _f7.Signal;
   import kabam.rotmg.assets.model._0V_v;
   
   public class _Y_F_
   {
       
      
      public const _my:Signal = new Signal(_Y_F_);
      
      public var id:int = 0;
      
      public var name:String = "";
      
      public var unlockLevel:int;
      
      public var _0p7:String;
      
      public var _0C_3:_0V_v;
      
      public var cost:int;
      
      public var limited:Boolean = false;
      
      public var skinSelectable:Boolean = true;
      
      public var playerExclusive:String = null;
      
      private var state:_0E_T_._1G_k;
      
      private var _1rA_:Boolean;
      
      public function _Y_F_()
      {
         this.state = _0E_T_._1G_k.NULL;
         super();
      }
      
      public function _0pE_() : Boolean
      {
         return this._1rA_;
      }
      
      public function _u5(param1:Boolean) : void
      {
         if(this._1rA_ != param1)
         {
            this._1rA_ = param1;
            this._my.dispatch(this);
         }
      }
      
      public function _0J_m() : _0E_T_._1G_k
      {
         return this.state;
      }
      
      public function setState(param1:_0E_T_._1G_k) : void
      {
         if(this.state != param1)
         {
            this.state = param1;
            this._my.dispatch(this);
         }
      }
   }
}
