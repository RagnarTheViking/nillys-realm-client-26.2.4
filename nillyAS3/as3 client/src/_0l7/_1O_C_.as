package _0l7
{
   import _1ar.Command;
   import _3b.DialogSignal;
   import _P_N_._0jy;
   
   public class _1O_C_ extends Command
   {
       
      
      [Inject]
      public var petName:String;
      
      [Inject]
      public var _0jt:int;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _1O_C_()
      {
         super();
      }
      
      override public function execute() : void
      {
         this._06Z_.dispatch(new _0jy(this.petName,this._0jt));
      }
   }
}
