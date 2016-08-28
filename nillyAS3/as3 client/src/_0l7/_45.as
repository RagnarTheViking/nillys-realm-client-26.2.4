package _0l7
{
   import _P_S_.Command;
   import _1F_z._0P_4;
   import _1F_z._07p;
   import _1F_z._1Z_D_;
   
   public class _45 extends Command
   {
       
      
      [Inject]
      public var _gh:int;
      
      [Inject]
      public var _0xI_:_0P_4;
      
      [Inject]
      public var _ak:_0l7._15g;
      
      [Inject]
      public var _12P_:_07p;
      
      public function _45()
      {
         super();
      }
      
      override public function execute() : void
      {
         if(this._gh < 0)
         {
            this._0xI_._0X_k();
         }
         else
         {
            this._0xI_._1mB_(this._0xI_._0oU_(this._gh));
         }
         this._12P_._05k = this._gh < 0?null:this._12P_._05k = this._0xI_._0oU_(this._gh);
      }
   }
}
