function GameVideoMemoryClear()
{
	// Clear textures. You might want not to perform this
	// between acts if doing S3K-like act transitions to avoid a lag
	draw_texture_flush();
}