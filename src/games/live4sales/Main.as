package games.live4sales {
	
	import com.citrusengine.core.CitrusEngine;

	import flash.geom.Rectangle;
	import flash.system.Capabilities;

	[SWF(backgroundColor="#000000", frameRate="60")]
	
	/**
	 * @author Aymeric
	 */
	public class Main extends CitrusEngine {

		public var compileForMobile:Boolean;
		public var isIpad:Boolean = false;
		
		public function Main() {

			compileForMobile = isIOS() ? true : false;
			
			if (compileForMobile) {
				
				// detect if iPad, landscape mode!
				isIpad = (stage.fullScreenHeight == 768 || stage.fullScreenHeight == 1536);
				
				if (isIpad)
					setUpStarling(true, 1, new Rectangle(64, 128, stage.fullScreenWidth, stage.fullScreenHeight));
				else
					setUpStarling(true, 1, new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight));
			} else 
				setUpStarling(true);
			
			// select Box2D Alchemy or Nape demo
			//state = new NapeLive4Sales();
			state = new Box2DLive4Sales();
		}
		
		override public function setUpStarling(debugMode:Boolean = false, antiAliasing:uint = 1, viewport:Rectangle = null):void {
			
			super.setUpStarling(debugMode, antiAliasing, viewport);
			
			if (compileForMobile) {
				// set iPhone & iPad size, used for Starling contentScaleFactor
				// landscape mode!
				_starling.stage.stageWidth = isIpad ? 512 : 480;
				_starling.stage.stageHeight = isIpad ? 384 : 320;
			}
		}
		
		public function isAndroid():Boolean {
    		return (Capabilities.version.substr(0,3) == "AND");
		}
		
		public function isIOS():Boolean {
	    	return (Capabilities.version.substr(0,3) == "IOS");
		}
	}
}