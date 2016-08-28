package _0l7
{
   import _P_S_.Command;
   import _1F_z._0P_4;
   import _S_b._O_e;
   import _3b.DialogSignal;
   import _P_N_._1bK_;
   import _1F_z._A_H_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   
   public class _0H_s extends Command
   {
       
      
      [Inject]
      public var type:int;
      
      [Inject]
      public var _06I_:_0P_4;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _0H_s()
      {
         super();
      }
      
      override public function execute() : void
      {
         this._06I_._0C_9(this._1P_0());
         this._06Z_.dispatch(new _1bK_(this._1tf._14O_));
      }
      
      private function _1P_0() : int
      {
         var _loc1_:String = _A_H_._162(this.type).value;
         return ObjectLibrary._0W_b(_loc1_).@type;
      }
   }
}
