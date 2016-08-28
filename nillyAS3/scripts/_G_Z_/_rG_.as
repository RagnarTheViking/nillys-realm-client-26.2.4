package _G_Z_
{
   import flash.display.DisplayObjectContainer;
   import _2l.ClientSettings;
   import _0H_w._6;
   
   public class _rG_
   {
       
      
      [Inject]
      public var _0ki:DisplayObjectContainer;
      
      [Inject]
      public var setup:ClientSettings;
      
      [Inject]
      public var analytics:_6;
      
      public function _rG_()
      {
         super();
      }
      
      public function execute() : void
      {
         this.analytics.init(this._0ki.stage,this.setup._Q_r());
      }
   }
}
