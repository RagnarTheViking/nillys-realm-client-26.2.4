package _1F_z
{
   import _f7.Signal;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   
   public class _gC_
   {
       
      
      public const _aL_:Signal = new Signal(_gC_);
      
      private var _15:uint;
      
      private var _7b:XML;
      
      public var level:int;
      
      public var points:int;
      
      public var name:String;
      
      public var description:String;
      
      private var _0T_o:Boolean;
      
      public function _gC_()
      {
         super();
      }
      
      public function set type(param1:uint) : void
      {
         this._15 = param1;
         this._7b = ObjectLibrary._0W_A_(this._15);
         this.name = this._7b.DisplayId;
         this.description = this._7b.Description;
      }
      
      public function setUnlocked(param1:Boolean) : void
      {
         this._0T_o = param1;
      }
      
      public function _19q() : Boolean
      {
         return this._0T_o;
      }
   }
}
