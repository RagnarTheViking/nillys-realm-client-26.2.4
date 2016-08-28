package _1lY_
{
   import _P_S_.Command;
   import _04h._1Q_v;
   import _0E_n._jE_;
   import _1U_P_._18w;
   
   public class _0uy extends Command
   {
       
      
      [Inject]
      public var arenaTime:Number;
      
      [Inject]
      public var arenaWave:int;
      
      [Inject]
      public var model:_1Q_v;
      
      [Inject]
      public var _H_u:_jE_;
      
      public function _0uy()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.model._1H_W_();
         this.model._0P_9.arenaTime = this.arenaTime;
         this.model._0P_9.arenaWave = this.arenaWave;
         this._H_u._0su.addChild(new _18w());
      }
   }
}
