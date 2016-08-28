package _0Q_5
{
   import flash.display.Loader;
   import _0H_N_._0q2;
   import flash.display.DisplayObject;
   import _0H_N_._146;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class URLAsset extends URLAssetBase
   {
       
      
      private var loader:Loader;
      
      private var _override:_0q2;
      
      public function URLAsset()
      {
         this.loader = addChild(new Loader()) as Loader;
         super();
      }
      
      override public function get content() : DisplayObject
      {
         return this.loader.content;
      }
      
      override public function get contentLoaderInfo() : _0q2
      {
         if(this._override == null)
         {
            this._override = new _146();
            this._override.loaderInfo = this.loader.contentLoaderInfo;
         }
         return this._override;
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null) : void
      {
         this.loader.load(param1,param2);
      }
      
      override public function unload() : void
      {
         this.loader.unload();
      }
   }
}
