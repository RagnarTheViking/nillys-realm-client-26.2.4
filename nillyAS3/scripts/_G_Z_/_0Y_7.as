package _G_Z_
{
   import _P_S_.Command;
   import _1I_S_._19G_;
   
   public class _0Y_7 extends Command
   {
       
      
      [Inject]
      public var data:XML;
      
      [Inject]
      public var _0T_8:_19G_;
      
      public function _0Y_7()
      {
         super();
      }
      
      override public function execute() : void
      {
         this._0T_8._0Z_O_(this.data.FilterList.split(/\r\n/g));
      }
   }
}
