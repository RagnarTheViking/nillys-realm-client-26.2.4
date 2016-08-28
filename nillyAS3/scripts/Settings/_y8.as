package Settings
{
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   import _2l.ClientSettings;
   import _1bq._0dj;
   
   public class _y8 implements IConfig
   {
       
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var _0rv:ClientSettings;
      
      public function _y8()
      {
         super();
      }
      
      public function configure() : void
      {
         if(this._0rv._17w())
         {
            this.context.extend(_0dj);
         }
      }
   }
}
