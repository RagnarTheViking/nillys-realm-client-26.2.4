package _0L_v
{
   import flash.display.DisplayObjectContainer;
   import _1J_2._01x;
   
   public class _J_n
   {
       
      
      [Inject]
      public var _0ki:DisplayObjectContainer;
      
      [Inject]
      public var viewManager:_01x;
      
      public function _J_n()
      {
         super();
      }
      
      [PostConstruct]
      public function init() : void
      {
         this.viewManager._rz(this._0ki);
      }
   }
}
