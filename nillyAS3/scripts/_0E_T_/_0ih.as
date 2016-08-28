package _0E_T_
{
   import _f7.Signal;
   
   public class _0ih
   {
       
      
      public const selected:Signal = new Signal(_0ih);
      
      public const _1H_Z_:Vector.<_0E_T_._1nY_> = new Vector.<_0E_T_._1nY_>(0);
      
      public const _E_G_:_0E_T_._0xK_ = new _0E_T_._0xK_();
      
      public var id:int;
      
      public var name:String;
      
      public var description:String;
      
      public var _13U_:String;
      
      public var _pb:String;
      
      public var _1bj:Number;
      
      public var _bT_:Vector.<int>;
      
      public var _0__m:Vector.<int>;
      
      public var _1gK_:_0E_T_._0A_e;
      
      public var _fF_:_0E_T_._0A_e;
      
      public var attack:_0E_T_._0A_e;
      
      public var defense:_0E_T_._0A_e;
      
      public var speed:_0E_T_._0A_e;
      
      public var dexterity:_0E_T_._0A_e;
      
      public var _0Y_h:_0E_T_._0A_e;
      
      public var _1G_e:_0E_T_._0A_e;
      
      public var unlockCost:int;
      
      private var _1D_k:int;
      
      private var _1rA_:Boolean;
      
      public function _0ih()
      {
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
            this._1rA_ && this.selected.dispatch(this);
         }
      }
      
      public function _0sH_() : int
      {
         return this._1D_k;
      }
      
      public function _0Q_s(param1:int) : void
      {
         this._1D_k = param1;
         this._E_G_._aU_(this._1D_k);
      }
   }
}
